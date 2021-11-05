#include "myLib.h"
#include "sound.h"

void setupSounds()
{
    REG_SOUNDCNT_X = SND_ENABLED;

    REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 |
                     DSA_OUTPUT_RATIO_100 |
                     DSA_OUTPUT_TO_BOTH |
                     DSA_TIMER0 |
                     DSA_FIFO_RESET |
                     DSB_OUTPUT_RATIO_100 |
                     DSB_OUTPUT_TO_BOTH |
                     DSB_TIMER1 |
                     DSB_FIFO_RESET;

    REG_SOUNDCNT_L = 0;
}

void playSoundA( const signed char* sound, int length, int loops) {
        dma[1].cnt = 0;

        int ticks = PROCESSOR_CYCLES_PER_SECOND / SOUND_FREQ;

        DMANow(1, sound, REG_FIFO_A, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

        REG_TM0CNT = 0;

        REG_TM0D = -ticks;
        REG_TM0CNT = TIMER_ON;


        soundA.length = length;
        soundA.data = sound;
        soundA.loops = loops;
        soundA.isPlaying = 1;
        soundA.frequency = SOUND_FREQ;
        soundA.duration = ((VBLANK_FREQ * length) / SOUND_FREQ);
        soundA.vBlankCount = 0;

}


void playSoundB( const signed char* sound, int length, int loops) {

        dma[2].cnt = 0;

        int ticks = PROCESSOR_CYCLES_PER_SECOND / SOUND_FREQ;

        DMANow(2, sound, REG_FIFO_B, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

        REG_TM1CNT = 0;

        REG_TM1D = -ticks;
        REG_TM1CNT = TIMER_ON;

        soundB.length = length;
        soundB.data = sound;
        soundB.loops = loops;
        soundB.isPlaying = 1;
        soundB.frequency = SOUND_FREQ;
        soundB.duration = ((VBLANK_FREQ * length) / SOUND_FREQ);
        soundB.vBlankCount = 0;

}

void setupInterrupts()
{
    REG_IME = 0;

    REG_INTERRUPT = interruptHandler;




    REG_IE |= INT_VBLANK;
    REG_DISPSTAT |= INT_VBLANK_ENABLE;
    REG_IME = 1;
}

void interruptHandler() {

    REG_IME = 0;

    if(REG_IF & INT_VBLANK) {
        if (soundA.isPlaying) {

            soundA.vBlankCount++;
            if (soundA.vBlankCount > soundA.duration) {
                if (soundA.loops) {
                    playSoundA(soundA.data, soundA.length, soundA.loops);
                } else {
                    soundA.isPlaying = 0;
                    dma[1].cnt = 0;
                    REG_TM0CNT = TIMER_OFF;
                }
            }

        }



        if (soundB.isPlaying) {

            soundB.vBlankCount++;
            if (soundB.vBlankCount > soundB.duration) {
                if (soundB.loops) {
                    playSoundB(soundB.data, soundB.length, soundB.loops);
                } else {
                    soundB.isPlaying = 0;
                    dma[2].cnt = 0;
                    REG_TM1CNT = TIMER_OFF;
                }
            }

        }


        REG_IF = INT_VBLANK;
    }

    REG_IME = 1;
}

void pauseGameSound() {

    soundA.isPlaying = 0;

    REG_TM0CNT = TIMER_OFF;
   

}

void unpauseGameSound() {


    soundA.isPlaying = 1;
    dma[2].cnt = 0;

    REG_TM0CNT = TIMER_ON;
    REG_TM1CNT = TIMER_OFF;

    soundB.isPlaying = 0;

}

void muteSound(int num) {
    switch (num) {
        case 1:

        if (soundA.isPlaying) {
            soundA.isPlaying = 0;
            REG_TM0CNT = TIMER_OFF;
        } else {
            soundA.isPlaying = 1;
            REG_TM0CNT = TIMER_ON;
        }
        break;


        case 2:
        if (soundB.isPlaying) {
            soundB.isPlaying = 0;
            REG_TM1CNT = TIMER_OFF;
        } else {
            soundB.isPlaying = 1;
            REG_TM1CNT = TIMER_ON;
        }

        break;

    }

}

void stopSound() {


    dma[1].cnt = 0;
    dma[2].cnt = 0;

    REG_TM0CNT = TIMER_OFF;
    REG_TM1CNT = TIMER_OFF;

    soundA.isPlaying = 0;
    soundB.isPlaying = 0;

}