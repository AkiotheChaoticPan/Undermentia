// Initialize movement variables based on arrow key inputs
var right = check_right();
var left  = check_left();
var down  = check_down();
var up    = check_up();

var HorizontalMovement = 0;
var VerticalMovement = 0;

// Adjust movement based on key inputs
if up
{
    VerticalMovement -= MoveSpeed;
}

if down
{
    VerticalMovement += MoveSpeed;
}

if right
{
    HorizontalMovement += MoveSpeed;
}

if left
{
    HorizontalMovement -= MoveSpeed;
}

// Update object's position
x += HorizontalMovement;
y += VerticalMovement;
