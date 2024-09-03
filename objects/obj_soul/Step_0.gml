// Initialize movement variables based on arrow key inputs
var right = keyboard_check(vk_right);
var left  = keyboard_check(vk_left);
var down  = keyboard_check(vk_down);
var up    = keyboard_check(vk_up);

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
