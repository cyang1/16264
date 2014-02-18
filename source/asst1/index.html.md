---
title: Humanoids Assignment 1
---

<header>
# Inverse Kinematics <span>Humanoids Assignment 1</span>
</header>
### Jeff Chen (jchen4), Cary Yang (caryy)

Since the provided Matlab code already moves the arm to minimize a cost function, all we did was define a function `f` that returns the distance between the grabber and the target, or `dot(fk(x) - x_d’, fk(x) - x_d’)`. This works because as Matlab minimizes the output of `f()`, the distance between the grabber and target will necessarily decrease. Next, to ensure that the grabber can actually grab the target at the end of the optimization, we set the value of `ceq` in constraints.m to simply be `fk(x) - x_d’`. When Matlab minimizes `f()`, it also makes sure that at the end of the minimization `ceq() = 0`.

<aside id="chart">
	<h4 class="chart-title">Reachable Positions</h4>
</aside>

We have attached a diagram of where the arm can reach. The diagram was created by simply stepping through the possible arm positions, given the joint angle limits (using six nested `for` loops). While the diagram doesn’t provide exact `(x, y, angle)` values, it would be a simple extension to show, for example, the maximum and minimum `x` and `y` values the arm can reach.

Allowing the robot to rotate the elbow into the other configuration adds significantly to the range of the arm. Attached is a diagram showing where the arm can reach with the elbow in the original position in blue, and where the arm can reach with the elbow rotated in red.

<div id="download-btn-container">
	<a href="ass1-arm.zip" class="btn blue" role="button">
		<i class="icon ion-code-download"></i>
		Download Our Code
	</a>
</div>