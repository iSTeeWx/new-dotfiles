#include <stdio.h>
#include <stdlib.h>

void getcpuload(int lastTotalJiffies, int lastWorkJiffies) {
  FILE *fp = fopen("/proc/stat", "r");

  if (fp == NULL) {
    return;
  }

  int numbers[7];

  fscanf(fp, "%*s %d %d %d %d %d %d %d", &numbers[0], &numbers[1], &numbers[2],
         &numbers[3], &numbers[4], &numbers[5], &numbers[6]);
  fclose(fp);

  int workJiffies = numbers[0] + numbers[1] + numbers[2];
  int totalJiffies =
      workJiffies + numbers[3] + numbers[4] + numbers[5] + numbers[6];

  int totalOverPeriod = totalJiffies - lastTotalJiffies;
  int workOverPeriod = workJiffies - lastWorkJiffies;

  if (totalOverPeriod == 0) {
    totalOverPeriod = 1;
  }

  float cpuUsage = (float)workOverPeriod / totalOverPeriod * 100;

  printf("%d %d %f\n", totalJiffies, workJiffies, cpuUsage);
  return;
}

int main(int argc, char *argv[]) {
  if (argc != 3) {
    printf("Usage: %s <last_total_jiffies> <last_work_jiffies>\n", argv[0]);
    return 1;
  }
  getcpuload(atoi(argv[1]), atoi(argv[2]));
  return 0;
}
