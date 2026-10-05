# DSP Lab Materials (ELT-3144: Digital Signal Processing)

MATLAB code for the Digital Signal Processing course (ELT-3144) labs.

> The lab manuals (PDFs) are not included in this repository. In the sections below, *Chapter N* refers to the chapters of the official ELT-3144 lab manual.

## Requirements

- **MATLAB** (R2019b or newer recommended)
- **Signal Processing Toolbox**: `impz`, `freqz`, `zplane`, `fir1`, `chebwin`, `hamming`, `downsample`, `residuez`
- **Simulink**: needed only for the `.slx` models in `LAB5-simulink`

## How to run (general)

Each `LABx-...` folder is self-contained. Scripts call helper functions from the **same folder**, so always run them from inside their own folder:

```matlab
cd LAB2-signal-operations-convolution        % move into the lab folder
baitap1d       % run a script by typing its name (no .m)
```

You can also open the file in the MATLAB Editor and press **Run** (F5). If MATLAB asks to *Change Folder* or *Add to Path*, choose **Change Folder**.

Files that begin with `function` are **functions**, not scripts. Call them with arguments, as in the examples below. Pressing Run on a function file gives a "Not enough input arguments" error.

---

## Lab overview

| Folder | Title | Topic |
|---|---|---|
| `LAB0-matlab-basics` | Lab 0: Getting started with MATLAB (*Làm quen với ngôn ngữ lập trình MATLAB*) | Variables, matrices, operators, plotting |
| `LAB1-signals` | Lab 1: Signals (*Tín hiệu*) | Representing discrete-time signals, plus time and frequency domains |
| `LAB2-signal-operations-convolution` | Lab 2: Signal operations & LTI systems | Unit step and impulse, signal addition, convolution, difference equations |
| `LAB3-signal-sampling` | Lab 3: Signal sampling (*Lấy mẫu tín hiệu*) | Sampling rates, aliasing, FFT spectrum, audio filtering |
| `LAB4` | Lab 4: Systems (*Hệ thống*) | Impulse response, difference equations, H(z), poles/zeros, frequency response |
| `LAB5-simulink` | Lab 5: Simulink | Building signal models in Simulink, Fourier series |
| `LAB6-system-structures` | Lab 6: System structure design (*Thiết kế cấu trúc hệ thống*) | Cascade (series) and parallel realizations of H(z) |
| `LAB8-fir-filter-design` | Lab 7 + 8: Digital filter design: FIR (*Thiết kế bộ lọc số – Bộ lọc FIR*) | Ideal low-pass filter, the windowing method (Hamming) |
| `lib-shared-functions` | Shared helper functions | Reusable signal generators and solutions collected from the labs |
| `midterm-exam` | Midterm exam (*Giữa kỳ*) | Function plotting, multi-tone signal, LTI system, moving-average filter |


---

## LAB0-matlab-basics: Getting started with MATLAB


| File | Type | Description | How to run |
|---|---|---|---|
| `lab0.m` | script | Exercises on vectors, trig functions, matrix ops, `linspace`, `zeros`, `rand` | `lab0` |
| `PBTask3p3_Mark.m` | script | Converts a random mark (1–100) into a grade with `if/elseif` | `PBTask3p3_Mark` |
| `subplot_ex.m` | script | Plots x², sin(0.2πx) and eˣ in three stacked subplots | `subplot_ex` |
| `note.txt` | text | Command Window log from the lab session, for reference only | not runnable |

> `subplot_ex.m` was originally named `subplot.m`. It was renamed so it no longer shadows MATLAB's built-in `subplot` function.

## LAB1-signals: Signals


| File | Type | Description | How to run |
|---|---|---|---|
| `veDoThiHamRR.m` | script | Plots the discrete signal x(n) = {2, 1, −1, **4**, 1, 4} for n = −3…2 with `stem` | `veDoThiHamRR` |
| `plotDirac.m` | function | Plots the unit impulse δ(n − n0) for n = −10…10 | `plotDirac(3)` |
| `nemngang.m` | script | Trajectory of a projectile thrown at an angle (physics exercise) | `nemngang` |

## LAB2-signal-operations-convolution: Signal operations & LTI systems

Covers Chapters 2 and 4 of the lab manual.

**Helper functions** (the scripts below use them, so keep them in this folder):

| File | Description | Example |
|---|---|---|
| `rect_pulse.m` | Unit step u(n − n0) on n1…n2 (also plots it) | `[x, n] = rect_pulse(-10, 10, 0)` |
| `delta_pulse.m` | Unit impulse δ(n − n0) on n1…n2 (also plots it) | `[x, n] = delta_pulse(-10, 10, 2)` |
| `sig_add.m` | Adds two signals with different time indices | `[y, n] = sig_add(x1, n1, x2, n2)` |
| `myConv.m` | Hand-written convolution (double loop) | `[y, n] = myConv([1 2 3], 0:2, [1 1], 0:1)` |

**Scripts:**

| File | Description | How to run |
|---|---|---|
| `baitap1d.m` | x(n) = (1/4)^(−n)·[u(n+1) + u(n−4)] | `baitap1d` |
| `baitap2b.m` | h(n) = 10u(n) − 5u(n−5) − 10u(n−10) + 5u(n−15) | `baitap2b` |
| `baitap2c.m` | h(n) = 2·sin(0.01πn)·cos(0.5πn), n = −200…200 | `baitap2c` |
| `bai3.m` | System y(n) + y(n−1) − ¾y(n−2) = x(n): impulse response from `impz` vs. the analytic formula, and the response to 2·sin(0.1πn) | `bai3` |
| `bai6.m` | Impulse response of y(n) − 4y(n−1) + 3y(n−2) = x(n) + x(n−1) | `bai6`, then `stem(n, h)` (the script computes h but does not plot it) |

## LAB3-signal-sampling: Signal sampling


| File | Type | Description | How to run |
|---|---|---|---|
| `bai1.m` | script | Samples a 1 kHz sine at 50f, 10f, 1.5f and 100f to show aliasing | `bai1` |
| `demo_signal_sampling.m` | script | Same idea with a two-tone signal at several sampling rates | `demo_signal_sampling` |
| `bai2.m` | script | 50 Hz + 120 Hz signal plus noise, shown in the time domain and as an FFT amplitude spectrum | `bai2` |
| `bai4.m` | script | Loads `audioclip1.wav`, plots its spectrum, low-pass filters it (`fir1` + Chebyshev window) and **plays** the result | `bai4` (turn your speakers on) |
| `audioclip1.wav` | data | Audio clip used by `bai4.m` | — |

> `bai4.m` must run from `LAB3-signal-sampling` so that `audioread` can find `audioclip1.wav`.
> `sound(outlo)` plays at MATLAB's default rate of 8192 Hz. Use `sound(outlo, fs)` to play it at the clip's real speed.

## LAB4: Systems

This lab only had a manual, so there is no `LAB4` folder in the repo. Solutions for this chapter (impulse response, zero/pole plot, frequency response) are in `lib-shared-functions/veduxung.m` and `lib-shared-functions/DuxungDutanso.m`.

## LAB5-simulink: Simulink


| File | Type | Description | How to run |
|---|---|---|---|
| `tong2sine.slx` | Simulink model | **Sum** of two sines: x1 = 2·sin(0.1πt) + x2 = 0.8·sin(0.05πt) | `open_system('tong2sine')`, then click **Run** |
| `tich2sine.slx` | Simulink model | **Product** of the same two sines | `open_system('tich2sine')`, then click **Run** |
| `bai2.slx` | Simulink model | Square wave built from a Fourier series | `open_system('bai2')`, then click **Run** |
| `bai2.m` | script | Square wave built from the first 7 odd harmonics: Σ 4·sin(2πkt)/(kπ), over 2 s | `bai2` |


## LAB6-system-structures: System structure design


| File | Type | Description | How to run |
|---|---|---|---|
| `dir2cas.m` | function | Converts direct form H(z) = B(z)/A(z) to **cascade** (second-order sections) form | see below |

```matlab
b = [1 -3 11 -27 18];          % numerator coefficients
a = [16 12 2 -4 -1];           % denominator coefficients
[b0, A, B] = dir2cas(b, a)     % b0 = gain, A = denominator sections, B = numerator sections (one row per section)
```

For the **parallel** form, see `lib-shared-functions/CTSS.m`: `[B, A, K] = CTSS(b, a)`.

## LAB8-fir-filter-design: Digital filter design (FIR)


| File | Type | Description | How to run |
|---|---|---|---|
| `ideal_LFP.m` | function | Impulse response of an ideal low-pass filter, h(n) = sin(ωc·n)/(πn), length L (forced to odd) | `h = ideal_LFP(pi/4, 31)` |
| `vd1.m` | script | Compares the magnitude response of an ideal LPF truncated to 31 taps, 501 taps, and 501 taps × Hamming window | `vd1` |
| `vd2.m` | script | Designs an FIR LPF with the Hamming window (ωp = 0.2π, ωs = 0.6π) and plots hd(n), w(n), h(n) and \|H(ω)\| in dB | `vd2` |

> `vd2.m` computes a non-integer filter length (M ≈ 17.35), so `hamming` rounds it and prints a warning. Using `M = ceil(...)` removes the warning.

---

## lib-shared-functions: shared helper functions

To use these from any folder, add `lib-shared-functions` to the path once per session:

```matlab
addpath('lib-shared-functions')   % run from the repo root
```

| File | Type | Description / usage |
|---|---|---|
| `step_sig.m` | function | Unit step: `[x, n] = step_sig(n0, n1, n2)` |
| `dirac_delta_sig.m` | function | Unit impulse: `[x, n] = dirac_delta_sig(n0, n1, n2)` |
| `ramp_sig.m` | function | Unit ramp: `[x, n] = ramp_sig(n0, n1, n2)` |
| `rect_sig.m` | function | Rectangular pulse: `[x, n] = rect_sig(n1, n2)` |
| `real_exp_sig.m` | function | Real exponential aⁿ: `[x, n] = real_exp_sig(0.9, 0, 20)` |
| `sig_add.m` | function | Signal addition: `[y, n] = sig_add(x1, n1, x2, n2)` |
| `mult_sig.m` | function | Signal multiplication: `[y, n] = mult_sig(x1, n1, x2, n2)` |
| `conv_sig.m` | function | Convolution with time index: `[y, ny] = conv_sig(x, nx, h, nh)` |
| `CTNT.m` | function | Cascade realization (same as `LAB6-system-structures/dir2cas.m`): `[b0, A, B] = CTNT(b, a)` |
| `CTSS.m` | function | Parallel realization with `residuez`: `[B, A, K] = CTSS(b, a)` |
| `bai1func.m` + `bai1.m` | function + script | f(x) = 3.2x⁴ − 6x² − 5x, evaluated and plotted: `bai1` |
| `veduxung.m` | script | y(n) − 5/2·y(n−1) + y(n−2) = x(n): impulse response, zero/pole plot, response to 2⁻ⁿu(n): `veduxung` |
| `DuxungDutanso.m` | script | H(z) = (z + 2)/(z − 0.5): impulse response, zero/pole plot, frequency response: `DuxungDutanso` |
| `LayMauTH.m` | script | Copy of `LAB3-signal-sampling/bai1.m`: `LayMauTH` |
| `LayMau_XDPhoTS.m` | script | Copy of `LAB3-signal-sampling/bai2.m`: `LayMau_XDPhoTS` |
| `sig_sampling.m` | script | Copy of `LAB3-signal-sampling/demo_signal_sampling.m`: `sig_sampling` |
| `XuLyAmThanh.m` | script | Copy of `LAB3-signal-sampling/bai4.m` (uses `lib-shared-functions/audioclip1.wav`): `XuLyAmThanh` |
| `xlat.m` | script | 400 + 800 Hz tone with a 2000 Hz noise tone, low-pass filtered by a 6th-order Butterworth (fc = 1200 Hz); plots all four signals: `xlat` |

## midterm-exam: midterm exam

Exam paper: `GK.docx`; submitted answers: `GK_NguyenHuyenTrang_20020727.docx`. Run the scripts from inside `midterm-exam/`. Everything this folder needs is in the folder itself:

```matlab
cd midterm-exam
bai2
```

| File | Type | Description | How to run |
|---|---|---|---|
| `bai1func.m` | function | f(x) = 3.2x⁴ − 6x² − 5x | `bai1func(-5)` (plot it with `lib-shared-functions/bai1.m`) |
| `bai2.m` | script | 3-second signal: 300 Hz → 300+400 Hz → 300+400+500 Hz | `bai2` |
| `bai3.m` | script | y(n) − 5/2·y(n−1) + y(n−2) = x(n): analytic impulse response h(n) = (4/3)·2ⁿ − (1/3)·(1/2)ⁿ vs. `impz`, zero/pole plot, response to 2⁻ⁿu(n) | `bai3` |
| `step.m` | function | Unit step: `[x, n] = step(n1, n2, n0)` | used by `bai3.m` |
| `myFilter.m` | function | Moving-average filter: `y = myFilter(x, width)` (an even width is increased by 1) | used by `bai4.m` / `test.m` |
| `bai4.m` | script | Noisy cosine smoothed with width 5 and 20 | `bai4` |
| `test.m` | script | Noisy sine smoothed with width 5 | `test` |

> `midterm-exam/step.m` shadows the Control System Toolbox `step` function while `midterm-exam/` is the current folder.
