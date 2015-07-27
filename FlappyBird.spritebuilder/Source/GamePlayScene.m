#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
	character = (Character *)[CCBReader load:@"Character"];
	[physicsNode addChild:character];
	timeSinceObstacle = 0.0f;
}

-(void)update:(CCTime)delta
{
    // Increment the time since the last obstacle was added
	timeSinceObstacle += delta; // delta is approx. 1/60th of a second
	
	// Check to see if two seconds have passed
	if (timeSinceObstacle > 2.0f) {
		[self addObstacle];
		timeSinceObstacle = 0.0f;
	}
}

- (void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
	// This will get called every time the player touches the screen
	[character flap];
}

@end
