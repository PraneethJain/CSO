#include <stdio.h>

#define ll long long

void sort(ll *arr, ll n);
// {
//   for (ll i = 1; i < n; ++i)
//   {
//     ll j = i - 1;
//     ll cur = arr[i];
//     while (j >= 0 && cur < arr[j])
//     {
//       arr[j + 1] = arr[j];
//       --j;
//     }
//     arr[j + 1] = cur;
//   }
// }

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
