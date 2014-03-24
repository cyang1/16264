---
title: Humanoids Assignment 3
---

<header>
# Control <span>Humanoids Assignment 3</span>
</header>
### Jeff Chen (jchen4), Cary Yang (caryy), Jeffrey Kim (jmkim1)

## Part 1

From class, we were given the equation `rest_leg_length = leg_length_default + (a * (height_desired - h(b)) + b) + c * (height_desired - last_max_height)`, where `a`, `b`, and `c` are constants, and `h(x)` is the maximum height obtained from a leg length of `leg_length_default + x`. Arbitrarily, we chose `b` to be `0.015`, and obatined `h(b) = 0.7`. To find `a`, we interpolated the maximum height value across a number of leg lengths, and chose a slope of `0.03`. Finally, `c` controls the strength of the feedback control. We simply assigned it arbitrary values until we found one that worked well, which was `0.1`. So our final equation is `rest_leg_length = leg_length_default + (0.03 * (height_desired - 0.7) + 0.015) + 0.1 * (height_desired - last_max_height)`.

## Part 2

To find gains `hip_air_k` and `hip_air_b` that would fit the requirements, we simply tested arbitrary values. We settled on `hip_air_k = 50` and `hip_air_b = 4`, which cause the leg to swing to the desired target without oscillation in about 0.28 seconds.

<div id="download-btn-container">
  <a href="ass3-arm.zip" class="btn blue" role="button">
    <i class="icon ion-code-download"></i>
    Download Our Code
  </a>
</div>
