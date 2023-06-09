#include <stdio.h>

#define ll long long

ll solve(ll *arr, ll size);

int main()
{
  ll n, m;
  scanf("%lli %lli", &m, &n);
  ll arr[n * m];
  for (ll i = 0; i < m * n; ++i)
    scanf("%lli", &arr[i]);

  ll res = solve(arr, m * n);
  printf("%lli\n", res);

  return 0;
}
