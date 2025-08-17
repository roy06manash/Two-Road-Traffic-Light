# Moore Traffic Light Controller (Two-Road: NS/EW)

## Description
This project implements a **Moore traffic light controller** for a two-road intersection (North-South and East-West). The state machine controls the traffic lights using a shared **1 Hz tick**. The controller ensures safe sequencing of green (G), yellow (Y), and red (R) lights.

---

## Timing Sequence
The traffic light follows a fixed timing sequence based on ticks:

| Phase | Duration (ticks) | NS Light | EW Light |
|-------|-----------------|----------|----------|
| 1     | 5               | G        | R        |
| 2     | 2               | Y        | R        |
| 3     | 5               | R        | G        |
| 4     | 2               | R        | Y        |

The sequence repeats continuously.

---

## State Diagram
## State Diagram

```mermaid
stateDiagram-v2
    [*] --> NS_G
    NS_G --> NS_Y : 5 ticks
    NS_Y --> EW_G : 2 ticks
    EW_G --> EW_Y : 5 ticks
    EW_Y --> NS_G : 2 ticks

Verification

The 1 Hz tick was verified by:

Simulation: Checked waveform shows a pulse every second.

Hardware Test: Connected tick signal to an LED, observed toggling once per second.

Notes

The Moore machine is synchronous with active-high reset.

Only one light per road is active at a time.

Phase durations can be easily adjusted by changing the tick counter limits.