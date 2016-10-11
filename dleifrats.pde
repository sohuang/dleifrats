
void setup() {
	size(600, 400);
}

void draw() {

}

class NormalParticle {
	double myX, myY, mySpeed, myAngle;
	int myColor = color(0, 0, 0);

	NormalParticle() {

	}

	void move() {
		myX += Math.cos(myAngle) * mySpeed;
		myY += Math.sin(myAngle) * mySpeed;
	}

	void show() {
		ellipse(2, 2, myX, myY);
	}
}