#include <iostream>
#include <Vectors.h>

using namespace std;

int main()
{
	Vector vec1;
	Vector vec2;
	Vector vec3;

	vec1 = vecInit(5, 6, 0);
	vec2 = vecInit(7, 8, 0);

	cout << "Vector 1 = {" << vec1.x << ", " << vec1.y << ", " << vec1.z << "}\n";
	cout << "Vector 2 = {" << vec2.x << ", " << vec2.y << ", " << vec2.z << "}\n\n";
	vec3 = vecSubtract(vec1, vec2);
	cout << "Their difference = {" << vec3.x << ", " << vec3.y << ", " << vec3.z << "}\n";
	vec3 = vecAdd(vec1, vec2);
	cout << "Their sum = {" << vec3.x << ", " << vec3.y << ", " << vec3.z << "}\n";
	vec3 = vecPerpendicular2D(vec1);
	cout << "Vector 1's 2D perpendicular = {" << vec3.x << ", " << vec3.y << ", " << vec3.z << "}\n";
	vec3 = vecPerpendicular2D(vec2);
	cout << "Vector 2's 2D perpendicular = {" << vec3.x << ", " << vec3.y << ", " << vec3.z << "}\n";
	cout << "Their dot product = " << vecDotProduct(vec1, vec2) << "\n";
	cout << "The magnitude of Vector 1 is " << vecGetMagnitude(vec1) << "\n";
	cout << "The magnitude of Vector 2 is " << vecGetMagnitude(vec2) << "\n\n";

	vec1 = vecNormalize(vec1);
	cout << "Vector 1 normalized = {" << vec1.x << ", " << vec1.y << ", " << vec1.z << "}\n";

	vec2 = vecSetAngle(180 / PI);
	vec2 = vecNormalize(vec2);
	cout << "Vector 2 set to an angle of 180 / PI and normalized = {" << vec2.x << ", " << vec2.y << ", " << vec2.z << "}\n";

	cout << "The magnitude of Vector 1 is " << vecGetMagnitude(vec1) << "\n";
	cout << "The magnitude of Vector 2 is " << vecGetMagnitude(vec2) << "\n\n";

	system("pause");
	return 0;
}