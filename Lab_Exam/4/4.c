#include <stdio.h>

#define ll long long

ll solve(ll n, ll m);

int main()
{
  ll n, m;
  scanf("%lli %lli", &n, &m);

  ll res = solve(n, m);

  printf("%lli\n", res);

  return 0;
}
