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
