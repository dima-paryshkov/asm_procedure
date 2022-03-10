#include <stdio.h>
#include <string.h>
#include <iostream>
using namespace std;

extern "C" int __stdcall FUNCSTR(char* in_str, int in_len, char* out_str, int out_len, char symbol);

void main()
{
	char symbol;
	char* inStr;
	inStr = new char[200];
	char* outStr;
	outStr = new char[200];
	

	cout << "Input string: ";
	cin >> inStr;

	cout << "Input symbol: ";
	cin >> symbol;

	if (FUNCSTR(inStr, strlen(inStr), outStr, sizeof(char) * 200, symbol) == 0)
	{
		cout << "Incorrect input data";
	}
	else
	{
		cout << "Result: " << outStr;
	}
}
