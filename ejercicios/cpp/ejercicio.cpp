#include <iostream>

using namespace std;

class Foo
{
public:
    Foo(int val = 0) : value (value)
    {
        cout << "def const" << endl;
    }
    
    ~Foo() = default;
    
    /*Foo& operator=(const Foo& foo)
    {
        cout << "const copy assignment" << endl;
        return *this;
    }*/
    
    Foo& operator=(Foo&& foo)
    {
        cout << "rvalue ref copy assignment" << endl;
        return *this;
    }
    
    Foo(const Foo& foo)
    {
        cout << "copy constructor" << endl;
    }
    
    Foo(Foo&& foo)
    {
        cout << "Rvalue copy constructor" << endl;
    }
    Foo getFoo()
    {
        return *this;
    }

    int val()
    {
        return 5;
    }
    
    int value;    
private:

};

int main()
{
    Foo a(1);
    Foo b(2);
    
    //Foo& c = a.getFoo();
    
    Foo c(a.getFoo());
    int&& z = a.val();
    z=12;
    cout << z << endl;
    //cout << a.value << endl;
    //a = b;
    
    //Foo c = b;
    
    //Foo d = a.getFoo();
    
    //Foo e(a.getFoo());
    return 0;
    
    
}
