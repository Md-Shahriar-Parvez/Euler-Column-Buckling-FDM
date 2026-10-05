# FDM-Based Convergence Analysis of Euler Column Buckling Eigenvalues

A MATLAB-based numerical study of the spatial discretization convergence of the Finite Difference Method (FDM) for the Euler-Bernoulli column buckling eigenvalue problem.

---

## 📌 Project Overview

The primary objective of this study is to determine the minimum spatial discretization required for the FDM eigenvalues to approach the corresponding exact analytical eigenvalues within a prescribed **±1% eigenvalue band** for a pinned-pinned column.

Using MATLAB's Symbolic Math Toolbox, the characteristic determinant of the resulting tridiagonal finite-difference system is constructed recursively as a symbolic polynomial. The polynomial is then evaluated at theoretical eigenvalue estimates while progressively refining the spatial grid.

The calculation connects the classical analytical Euler buckling solution with a discrete eigenvalue formulation and its numerical convergence.

---

## 📐 Mathematical Background

### 1. Governing Differential Equation

The flexural buckling of a slender Euler-Bernoulli column subjected to an axial compressive load $P$ is governed by

$$
EI\frac{d^2y}{dx^2}+Py=0
$$

or equivalently,

$$
\frac{d^2y}{dx^2}+\lambda^2y=0,
$$

where

$$
\lambda^2=\frac{P}{EI}.
$$

For a pinned-pinned column,

$$
y(0)=0,\qquad y(L)=0.
$$

---

### 2. Analytical Eigenvalues

The exact eigenvalues of the continuous problem are

$$
\lambda_i^2=\frac{i^2\pi^2}{L^2},
\qquad i=1,2,3,\ldots
$$

and the corresponding critical buckling loads are

$$
P_{cr}^{(i)}=\frac{i^2\pi^2EI}{L^2}.
$$

Here, $i$ represents the buckling mode number.

---

### 3. FDM Discretization

The second derivative is approximated using the central finite-difference formula

$$
\frac{d^2y}{dx^2}
\approx
\frac{y_{k-1}-2y_k+y_{k+1}}{h^2},
$$

where

$$
h=\frac{L}{n-1},
$$

and $n$ denotes the total number of grid nodes.

Substitution into the governing equation gives

$$
y_{k-1}+(E-2)y_k+y_{k+1}=0,
$$

where the dimensionless eigenvalue parameter is defined as

$$
E=\lambda^2h^2.
$$

This leads to a tridiagonal eigenvalue system.

---

### 4. Recursive Characteristic Determinant

Rather than explicitly calculating the determinant of the tridiagonal matrix for every grid size, its determinant is generated recursively.

Defining

$$
R=E-2,
$$

the characteristic determinant follows the second-order recurrence

$$
D_{k+1}=-(E-2)D_k-D_{k-1},
$$

with the corresponding initial terms implemented in the MATLAB code.

The resulting $D(E)$ is a symbolic polynomial whose roots correspond to the discrete FDM eigenvalues.

---

## ⚙️ How the Algorithm Works

1. **Initialization**
   The calculation begins with $n=4$ grid nodes.

2. **Grid Refinement**
   If the convergence criterion is not satisfied, the number of grid nodes is incremented:

   $$n\rightarrow n+1.$$

3. **Theoretical Eigenvalue Evaluation**
   For each mode $i$, the corresponding dimensionless theoretical eigenvalue is calculated as

   $$E_i^{\mathrm{exact}}=\frac{i^2\pi^2}{(n-1)^2}.$$

4. **±1% Eigenvalue Band**
   Upper and lower values are generated as

   $$E_i^{+}=1.01E_i^{\mathrm{exact}},$$

   $$E_i^{-}=0.99E_i^{\mathrm{exact}}.$$

5. **Symbolic Determinant Evaluation**
   These values are substituted into the recursively generated characteristic polynomial.

6. **Convergence Check**
   The algorithm checks whether the magnitude of the characteristic determinant becomes sufficiently small:

   $$0<|D(E_i^\pm)|<0.01.$$

7. **Result**
   The calculation terminates when the prescribed convergence criterion is first satisfied and reports the corresponding grid size $n$ and mode index $i$.

---

## 🔬 What This Study Demonstrates

The study illustrates the connection between the continuous Euler buckling problem and its finite-difference eigenvalue formulation:

$$
\boxed{
\text{Euler Buckling Equation}
\rightarrow
\text{Finite Difference Discretization}
\rightarrow
\text{Tridiagonal Eigenvalue System}
\rightarrow
\text{Recursive Characteristic Determinant}
\rightarrow
\text{Eigenvalue Convergence}
}
$$

The approach emphasizes the mathematical structure underlying the numerical method rather than treating the Euler critical-load equation as an isolated formula.

---

## 🚀 Getting Started

### Prerequisites

* MATLAB 
* Symbolic Math Toolbox

---

## 📁 Repository Contents

* `FDM_Euler_Column_Buckling.m` — MATLAB implementation of the recursive characteristic-polynomial and convergence analysis.
* `Euler Column Buckling FDM.pdf` — Detailed mathematical derivation of the Euler column FDM formulation.

---

## 📄 Study Note

This repository accompanies an independent mathematical and computational study of Euler column buckling. The exact analytical solution is used as a reference for examining the convergence behavior of the finite-difference formulation as the spatial discretization is refined.

---

## Author

**Md. Shahriar Parvez**
B.Sc. in Mechanical Engineering, Bangladesh University of Engineering and Technology (BUET)
