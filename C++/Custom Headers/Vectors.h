struct Vector 
{
	float x;
	float y;
	float z;
};
typedef struct Vector Vector;

const float PI = 3.14159f;

Vector vecInit(float x, float y, float z);
Vector vecSetAngle(float angle);

Vector vecNormalize(Vector vector);

float vecGetMagnitude(Vector vector);
float vecGetMagnitudeSquared(Vector vector);
Vector vecAdd(Vector vector1, Vector vector2);
Vector vecSubtract(Vector vector1, Vector vector2);
float vecDotProduct(Vector vector1, Vector vector2);
Vector vecCrossProduct(Vector vector1, Vector vector2);
Vector vecPerpendicular2D(Vector vector);
Vector vecCombine2(Vector vector1, Vector vector2);
Vector vecCombine3(Vector vector1, Vector vector2, Vector vector3);
Vector vecRotate2D(Vector vector, float rotateAngle);
Vector vecScaleConst(Vector vector, float constant);
Vector vecDivideConst(Vector vector, float constant);
Vector vecMultiply(Vector vector1, Vector vector2);
