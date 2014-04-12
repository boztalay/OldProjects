#include <Vectors.h>
#include <math.h>

Vector vecInit(float x, float y, float z) 
{
	Vector vector;
	
	vector.x = x;
	vector.y = y;
	vector.z = z;

	return vector;
}

Vector vecSetAngle(float angle) 
{
	Vector vector;
	
	vector.x = cos(angle);
	vector.y = sin(angle);
	vector.z = 0.0f;;

	return vector;
}

Vector vecNormalize(Vector vector) 
{
	float magnitude;
	
	magnitude = sqrt((vector.x * vector.x) +
					 (vector.y * vector.y) +
					 (vector.z * vector.z));
	vector.x /= magnitude;
	vector.y /= magnitude;
	vector.z /= magnitude;

	return vector;
}

float vecGetMagnitude(Vector vector) 
{
	return sqrt((vector.x * vector.x) +
				(vector.y * vector.y) +
				(vector.z * vector.z));
}

float vecGetMagnitudeSquared(Vector vector) 
{
	return ((vector.x * vector.x) +
			(vector.y * vector.y) +
			(vector.z * vector.z));
}

Vector vecAdd(Vector vector1, Vector vector2) 
{
	Vector vector;
	
	vector.x = (vector1.x + vector2.x);
	vector.y = (vector1.y + vector2.y);
	vector.z = (vector1.z + vector2.z);

	return vector;
}

Vector vecSubtract(Vector vector1, Vector vector2) 
{
	Vector vector;
	
	vector.x = (vector1.x - vector2.x);
	vector.y = (vector1.y - vector2.y);
	vector.z = (vector1.z - vector2.z);

	return vector;
}

float vecDotProduct(Vector vector1, Vector vector2) 
{
	return ((vector1.x * vector2.x) +
			(vector1.y * vector2.y) +
			(vector1.z * vector2.z));
}

Vector vecCrossProduct(Vector vector1, Vector vector2) 
{
	Vector vector;
	
	vector.x = ((vector1.y * vector2.z) - (vector1.z * vector2.y));
	vector.y = ((vector1.z * vector2.x) - (vector1.x * vector2.z));
	vector.z = ((vector1.x * vector2.y) - (vector1.y * vector2.x));

	return vector;
}

Vector vecPerpendicular2D(Vector vector)
{
	Vector temp;

	temp.x = -vector.y;
	temp.y = vector.x;
	temp.z = 0.0f;

	return temp;
}

Vector vecCombine2(Vector vector1, Vector vector2)
{
	Vector vector;

	vector.x = ((vector1.x + vector2.x) / 2);
	vector.y = ((vector1.y + vector2.y) / 2);
	vector.z = ((vector1.z + vector2.z) / 2);

	return vector;
}

Vector vecCombine3(Vector vector1, Vector vector2, Vector vector3)
{
	Vector vector;

	vector.x = ((vector1.x + vector2.x + vector3.x) / 3);
	vector.y = ((vector1.y + vector2.y + vector3.y) / 3);
	vector.z = ((vector1.z + vector2.z + vector3.z) / 3);

	return vector;
}

Vector vecRotate2D(Vector vector, float rotateAngle)
{
	float angle = 0.0f;
	
	angle = atan2(vector.y, vector.x);
	angle += rotateAngle;
	
	vector.x = cos(angle);
	vector.y = sin(angle);

	return vector;
}

Vector vecScaleConst(Vector vector, float constant)
{
       vector.x = (vector.x * constant);
       vector.y = (vector.y * constant);
       vector.z = (vector.z * constant);
       
       return vector;
}

Vector vecDivideConst(Vector vector, float constant)
{
       vector.x = (vector.x / constant);
       vector.y = (vector.y / constant);
       vector.z = (vector.z / constant);
       
       return vector;
}

Vector vecMultiply(Vector vector1, Vector vector2)
{
	Vector vector;
	
	vector.x = (vector1.x * vector2.x);
	vector.y = (vector1.y * vector2.y);
	vector.z = (vector1.z * vector2.z);

	return vector;
}
