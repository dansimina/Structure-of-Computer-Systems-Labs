from pandas import *
from numpy import *
from matplotlib.pyplot import *

file = read_csv("04-12-22_temperature_measurements.csv", parse_dates=['Timestamp'])

def CUSUM(x, threshold, drift):
    gp = 0
    gm = 0
    t_abnormal = []
    fileContent = []

    for i in range(1, len(x)):
        S = x[i][1] - x[i - 1][1]
        gp = max([(gp + S - drift), 0])
        gm = max([(gm - S - drift), 0])

        if gp > threshold or gm > threshold:
            t_abnormal.append(x[i])
            gp = 0
            gm = 0

            fileContent.append(str(i) + ", 1")
        else:
            fileContent.append(str(i) + ", 0")

    return t_abnormal, fileContent

def make_plot(timestamp, sensor, name):
    xpoints = array(timestamp)
    ypoints = array([x[1] for x in sensor])

    plot(xpoints, ypoints, label = 'Values')

    cusum, fileContent = CUSUM(sensor, 200, 50)

    with open(name + '_python_results_TB.txt', 'w') as f:
        for i in fileContent:
            f.write(i + '\n')

    xpoints_CUSUM = array([x[0] for x in cusum])
    ypoints_CUSUM = array([x[1] for x in cusum])
    plot(xpoints_CUSUM, ypoints_CUSUM, 'x', color = 'r', label = 'Anomaly')

    title(name)
    legend()
    show()

def make_file(sensor, name):
    with open(name + '_binary.txt', 'w') as f:
        for i in sensor:
            b = bin(i[1])[2:]
            s = (32 - len(b)) * '0' + b
            f.write(s + '\n')

Timestamp = [x for x in file['Timestamp']]
DS18B20 = [(x[0], x[1]) for x in file.values]
DHT11 = [(x[0], x[2]) for x in file.values]
LM35DZ = [(x[0], x[3]) for x in file.values]
BMP180 = [(x[0], x[4]) for x in file.values]
Thermistor = [(x[0], x[5]) for x in file.values]
DHT22 = [(x[0], x[6]) for x in file.values]

make_plot(Timestamp, DS18B20, 'DS18B20')
make_plot(Timestamp, DHT11, 'DHT11')
make_plot(Timestamp, LM35DZ, 'LM35DZ')
make_plot(Timestamp, BMP180, 'BMP180')
make_plot(Timestamp, Thermistor, 'Thermistor')
make_plot(Timestamp, DHT22, 'DHT22')

make_file(DS18B20, 'DS18B20')
make_file(DHT11, 'DHT11')
make_file(LM35DZ, 'LM35DZ')
make_file(BMP180, 'BMP180')
make_file(Thermistor, 'Thermistor')
make_file(DHT22, 'DHT22')

