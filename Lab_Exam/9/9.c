#include <stdio.h>

#define ll long long

ll solve(ll *arr, ll n);

int main()
{
  ll n;
  scanf("%lli", &n);

  ll arr[n];
  for (ll i = 0; i < n; ++i)
    scanf("%lli", &arr[i]);

  ll res = solve(arr, n);

  printf("%lli\n", res);

  return 0;
}
