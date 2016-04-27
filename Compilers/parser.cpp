#include<iostream>
#include<string>
#include<vector>
using namespace std;

int main()
{

vector<string> cfg;
cfg.push_back(make_pair("S","aBD"));
cfg.push_back(make_pair("S","aCD"));
cfg.push_back(make_pair("B","Eb"));
cfg.push_back(make_pair("B","b"));
cfg.push_back(make_pair("C","Ec"));
cfg.push_back(make_pair("C","c"));
cfg.push_back(make_pair("D","d"));
cfg.push_back(make_pair("E","a"));
cfg.push_back(make_pair("E",""));
cout << "vector size = "<<cfg.size() <<" vector value="<<cfg[0]<<endl;
	return 0;
}
