#include <stdio.h>

#define ll long long

void solve(ll *arr, ll n);

int main()
{
  ll n;
  scanf("%lli", &n);
  ll arr[n + 1];
  solve(arr, n);

  for (ll i = 1; i <= n; ++i)
    printf("%lli ", arr[i]);
  printf("\n");

  return 0;
}
