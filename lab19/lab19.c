#include <iostream>
#include <iomanip>
#include <cstring>
using namespace std;

extern "C" int String_length( char *);

int main() {
	char str[] = "Cat in the hat";
	cout << str << " C-String length = " << strlen(str) << endl;
	cout << str << " ASM length = " << String_length(str) << endl;
	return 0;
}

