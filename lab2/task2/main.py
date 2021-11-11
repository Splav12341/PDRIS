import numpy as np

a = np.array([1,2])
s = a.sum()

with open("./mz/text.txt", "w") as file:
  file.write(f"sum = {s}")
