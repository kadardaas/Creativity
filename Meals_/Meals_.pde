class MealData {
    String day;
    int meals;
    String[] mealTypes;

    MealData(String day, int meals, String[] mealTypes) {
        this.day = day;
        this.meals = meals;
        this.mealTypes = mealTypes;
    }

    void display(int x, int y, int barWidth, int barHeight) {
        fill(100, 150, 250);
        rect(x, y, barWidth, -barHeight);
        fill(0);
        text(this.day, x + barWidth / 2, height - 10);
        if (mouseX > x && mouseX < x + barWidth && mouseY > height - barHeight) {
            displayDetails(mouseX, mouseY);
        }
    }

    void displayDetails(int mouseX, int mouseY) {
        fill(255);
        rect(mouseX, mouseY - 60, 150, 50);
        fill(0);
        textAlign(LEFT, TOP);
        text("Day: " + this.day, mouseX + 5, mouseY - 55);
        text("Meals: " + this.meals, mouseX + 5, mouseY - 40);
        text("Types: " + join(this.mealTypes, ", "), mouseX + 5, mouseY - 25);
        textAlign(CENTER, CENTER);
    }
}

MealData[] weekMeals;

void setup() {
    size(800, 400);
    background(255);
    textAlign(CENTER, CENTER);
    
    weekMeals = new MealData[7];
    weekMeals[0] = new MealData("Mon", 3, new String[]{"Breakfast", "Lunch", "Dinner"});
    weekMeals[1] = new MealData("Tue", 2, new String[]{"Breakfast", "Dinner"});
    weekMeals[2] = new MealData("Wed", 4, new String[]{"Breakfast", "Snack", "Lunch", "Dinner"});
    weekMeals[3] = new MealData("Thu", 3, new String[]{"Breakfast", "Lunch", "Dinner"});
    weekMeals[4] = new MealData("Fri", 2, new String[]{"Lunch", "Dinner"});
    weekMeals[5] = new MealData("Sat", 3, new String[]{"Breakfast", "Lunch", "Dinner"});
    weekMeals[6] = new MealData("Sun", 4, new String[]{"Breakfast", "Lunch", "Snack", "Dinner"});
}

void draw() {
    background(255);
    drawBarChart();
}

void drawBarChart() {
    int barWidth = width / weekMeals.length;
    for (int i = 0; i < weekMeals.length; i++) {
        int barHeight = weekMeals[i].meals * 50; // Scale the bar height
        weekMeals[i].display(i * barWidth, height - barHeight, barWidth - 10, barHeight);
    }
}
