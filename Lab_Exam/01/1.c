#include <stdio.h>

#define ll long long

ll solve(ll x);

int main()
{
  ll x;
  scanf("%lli", &x);

  ll res = solve(x);

  printf("%lli\n", res);

  return 0;
}
