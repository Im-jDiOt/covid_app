import scipy.integrate as spi
import numpy as np
import matplotlib.pyplot as pl

# Initial conditions
S0 = 9772
E0 = 818
I0 = 31
R0 = 2

t = np.linspace(0, 100, 100)

N = S0 + I0 + R0

S0_ = S0 / N
E0 = E0 / N
I0 = I0 / N
R0 = R0 / N

print(S0_)

beta = 0.1934
ramda = 1 / 14
sigma = 0.25

Input = (S0_, E0, I0)
Y[1] = beta * X[0] * X[2] - sigma * X[1] - mu * X[1]


def SEIR(INT, t):
    '''The main set of equation'''
    Y = np.zeros((3))
    X = INT  # S0,   I0
    Y[0] = mu - beta * X[0] * X[2] - mu * X[0]
    Y[1] = beta * X[0] * X[2] - sigma * X[1] - mu * X[1]
    Y[2] = sigma * X[1] - gamma * X[2] - mu * X[2]
    return Y


t_start = 0.0;
t_end = 150;
t_inc = 1.0
t_range = np.arange(t_start, t_end + t_inc, t_inc)
SEIR = spi.odeint(SEIR, Input, t_range)

Rec = 1. - (SEIR[:, 0] + SEIR[:, 1] + SEIR[:, 2])

pl.figure(figsize=(15, 10))
pl.subplot(311)
pl.plot(SEIR[:, 0], '-g', label='Susceptibles');
pl.legend(loc=0)
pl.title('Prediction of nCOV-19 SEIR model')
pl.xlabel('Time(days)')
pl.ylabel('Susceptibles')

pl.subplot(312)
pl.plot(SEIR[:, 1], '-b', label='Exposed')
pl.plot(SEIR[:, 2], '-r', label='Infectious');
pl.legend(loc=0)
pl.xlabel('Time(days)')
pl.ylabel('Infectious')

pl.subplot(313)
pl.plot(Rec, '-k', label='Recovereds')
pl.xlabel('Time(days)')
pl.legend(loc=0)
pl.ylabel('Recovereds')
pl.show()