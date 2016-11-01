#include <iostream>
#include <set>

using namespace std;

int main()
{
    
    auto convert = [](int x)
    { 
        set<int> lista;
        while (x > 0)
        {
            lista.insert(x%10);
            x/=10;
        }
        return lista;
    };

    int x = 2;
    
    auto check = [&x, convert](int i)
    {
        for (int a = 2; a < (i + 1); a++)
        {
            set<int> temp = convert(x);
            if (temp != convert(x*a))
                return -1;
        }
        return x;
    };
    
    
    while (1)
    {
        x++;
        if (check(5) != -1)
            break;
    }
    
    cout << "La respuesta es " << x << endl;

    return 1;
}
