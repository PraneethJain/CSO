#include <stdio.h>

#define ll long long

ll solve(ll *arr, ll n, ll b);

int main()
{
  ll n, b;
  scanf("%lli %lli", &n, &b);
  ll arr[n];
  for (ll i = 0; i < n; ++i)
    scanf("%lli", &arr[i]);

  ll res = solve(arr, n, b);

  printf("%lli\n", res);

  return 0;
}
