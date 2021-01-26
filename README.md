# steady-state-detection
 
Recontruction of the following papers on the topic of steady state detection / identification methods:

[1] J. D. Kelly and J. D. Hedengren, “A steady-state detection (SSD) algorithm to detect non-stationary drifts in processes,” J. Process Control, vol. 23, no. 3, pp. 326–331, 2013.

![alt text](https://github.com/auralius/steady-state-detection/blob/main/kelly/result1.png)

![alt text](https://github.com/auralius/steady-state-detection/blob/main/kelly/result2.png)

A closer probability to 1 means the more likely it is in a steady state condition.

------------------------------------------------------

[2] R. R. Rhinehart, “Automated steady and transient state identification in noisy processes,” in Proceedings of the American Control Conference, 2013, no. June 2013, pp. 4477–4493.

The figure below is without data windowing applied, each data poin is processed immediately. It does not look so good. Perhaps, it needs more tuning for the lambda values.

![alt text](https://github.com/auralius/steady-state-detection/blob/main/rhinehart/result1.png)


The figure below is with data windowing applied. It looks nice ;-)

![alt text](https://github.com/auralius/steady-state-detection/blob/main/rhinehart/result2.png)

The lower R-value means the more likely it is in a steady state condition.

------------------------------------------------------

The plant that is used:

Continously stirred tank reactor (CSTR):

http://apmonitor.com/che436/index.php/Main/CaseStudyCSTR
