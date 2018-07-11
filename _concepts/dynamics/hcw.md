---
layout: page
title: "Hill-Clohessy-Wiltshire Equations"
topic: "dynamics"
subtopic: "relative dynamics"
date: 2018-07-10 08:00
---

The linearized relative dynamics between a chaser satellite and a target object in orbit can be described by the following set of equations:

$$
\begin{align*}
\ddot{x}(t) &= 2n \cdot \dot{y}(t) + 3n^2 \cdot x(t) \; [\;+\; \frac{F_x}{m} \; ] \\[0.3em]
\ddot{y}(t) &= -2n \cdot \dot{x}(t)  \; [\;+\; \frac{F_y}{m} \; ]  \\[0.3em]
\ddot{z}(t) &= -n^2 \cdot z(t)  \; [\;+\; \frac{F_z}{m} \; ]
\end{align*}
$$

with the terms appearing inside the brackets being optional (controlled case) {% cite lovell2014relative %}.


Assumptions:
* Distance from target to chaser is much much smaller than the orbital radius, i.e., $\vert \boldsymbol{\rho}(t) \vert < < \vert \mathbf{r}_{tgt} \vert \Rightarrow \boldsymbol{r} _{ch} \approx \mathbf{r} _{tgt}  $
* A first order approximation on the term $\left( 1 + \frac{2x}{r_{tgt}} \right)^{-3/2} \approx 1 - \frac{3x}{r_{tgt}}$
* Reduce to time invariant by assuming target orbit's eccentricity equal to zero.

## Discrete System Equations

The discrete, analytical solution to the system can be expressed as a traditional LTI system of the form $ \mathbf{x}_{k+1} = \mathbf{A}_d \mathbf{x}_k + \mathbf{B}_d \mathbf{u}_k$ {% cite jewison2018probabilistic %}, where the system matrix is of the form 


$$ 
\begin{align*} \mathbf{A}_d = \begin{bmatrix} 
4-3\cos(nT) & 0 & 0 & \frac{1}{n}\sin(nT) & \frac{2}{n}(1-\cos(nT)) & 0 \\\\[0.3em] 
6(\sin(nT)-nT) & 1 & 0 & -\frac{2}{n}(1-\cos(nT)) & \frac{1}{n}(4\sin(nT)-3nT) & 0 \\\\[0.3em]
0 & 0 & \cos(nT) & 0 & 0 & \frac{1}{n}\sin(nT) \\\\[0.3em] 
3n\sin(nT) & 0 & 0 & \cos(nT) & 2\sin(nT) & 0 \\\\[0.3em] 
-6n(1-\cos(nT)) & 0 & 0 & -2\sin(nT) & 4\cos(nT)-3 & 0 \\\\[0.3em] 
0 & 0 & -n\sin(nT) & 0 & 0 & \cos(nT) \\\\[0.3em]
\end{bmatrix}, 
\end{align*} 
$$

and the control input matrix is expressed as

$$
\begin{align*}
\mathbf{B}_d = \begin{bmatrix}
\frac{1}{n}\sin(nT) & \frac{2}{n}(1-\cos(nT)) & 0 \\\\[0.3em]
-\frac{2}{n^2}(nT - \sin(nT)) & \frac{4}{n^2}(1-\cos(nT))-\frac{3}{2} T^2 & 0 \\\\[0.3em]
0 & 0 & \frac{1}{n^2}(1-\cos(nT)) \\\\[0.3em]
\frac{1}{n}\sin(nT) & \frac{2}{n}(1-\cos(nT)) & 0 \\\\[0.3em]
-\frac{2}{n}(1-cos(nT)) & \frac{4}{n}\sin(nT) - 3T & 0 \\\\[0.3em]
0 & 0 & \frac{1}{n}\sin(nT) \\\\[0.3em]
\end{bmatrix}.
\end{align*}
$$



## Bibliography

{% bibliography --cited_in_order %}


