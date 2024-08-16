// Initialize movement variables based on arrow key inputs
var right = check_right_pressed();
var left  = check_left_pressed();
var down  = check_down_pressed();
var up    = check_up_pressed();

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
