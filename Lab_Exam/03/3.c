#include <stdio.h>

#define ll long long

ll solve(ll n);

int main()
{
  ll n;
  scanf("%lli", &n);

  ll res = solve(n);

  if (res)
    printf("True\n");
  else
    printf("False\n");

  return 0;
}
