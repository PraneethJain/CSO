#include <stdio.h>

#define ll long long

void sort(ll *arr, ll n);

int main()
{
  ll n;
  scanf("%lli", &n);
  ll arr[n];
  for (ll i = 0; i < n; ++i)
    scanf("%lli", &arr[i]);

  sort(arr, n);

  for (ll i = 0; i < n; ++i)
    printf("%lli ", arr[i]);
  printf("\n");

  return 0;
}
