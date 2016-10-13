NormalParticle[] particles = new NormalParticle[200];

void setup() {
	size(600, 400);
	background(0);
	for (int i = 0; i < particles.length; i++) {
		particles[i] = new NormalParticle();
	}
}

void draw() {
	background(0);
	for (int i = 0; i < particles.length; i++) {
		if (particles[i].offscreen()) {
			particles[i] = new NormalParticle();
		}
		particles[i].move();
		particles[i].show();
	}
}

class NormalParticle implements Particle {
	double myX, myY, mySpeed, myAngle, mySize, myStartSize;
	int myColor;
	// , myTwinkle;

	NormalParticle() {
		myX = width/2;
		myY = height/2;
		mySpeed = (Math.random() * 6) - 3;
		myAngle = (Math.random() * PI);
		myColor = color(0, 0, 0);
		myStartSize = 0.2;
		// myTwinkle = (int)(Math.random() * 10 + 1);
	}

	// NormalParticle(int size) {
	// 	myX = width/2;
	// 	myY = height/2;
	// 	mySpeed = (Math.random() * 4) - 2;
	// 	myAngle = (Math.random() * PI);
	// 	myColor = color(0, 0, 0);
	// 	mySize = size;
	// }

	// NormalParticle(double x, double y) {
	// 	myX = x;
	// 	myY = y;
	// 	mySpeed = (Math.random() * 4) - 2;
	// 	myAngle = (Math.random() * PI);
	// 	myColor = color(0, 0, 0);
	// 	mySize = 2;
	// }

	void move() {
		myX += Math.cos(myAngle) * mySpeed;
		myY += Math.sin(myAngle) * mySpeed;
		if (mySize <= 2.5) {
			mySize = (dist((float)myX, (float)myY, width / 2, height / 2) * myStartSize) / 2;
		}
	}

	void show() {
		noStroke();
		// if (frameCount % myTwinkle == 0) {
		// 	fill(0);
		// } else {
		// 	fill(255);
		// }
		ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
	}

	boolean offscreen() {
		return myX >= width || myX <= 0 || myY >= height || myY <= 0;
	}
}

interface Particle {
	public void show();
	public void move();
}