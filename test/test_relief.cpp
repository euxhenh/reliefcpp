#include <iostream>

#include "Operations.h"
#include "Relief.h"
#include "Utils.h"

using namespace std;

int main()
{
    vector<double> v{1, 2, 3};
    v /= 2;
    for (auto c : v) cout << c << " ";
    cout << "\n";
    return 0;
    Relief r(100, 4);
    const int N = 400;
    const int M = 32*32;

    vector<vector<double>> X(N, vector<double>(M));
    for (size_t i = 0; i < N; ++i) {
        for (size_t j = 0; j < M; ++j) {
            X[i][j] = i + j;
        }
    }
    vector<size_t> y(N);
    for (size_t i = 0; i < N; ++i) {
        y[i] = i % 2;
    }

    r.fit(X, y);
    return 0;
}