# Android Shopping List App

An Eclipse/ADT-era Android application that guides a customer through building a food-and-drink order within a chosen budget.

## User flow

1. A splash screen opens the application.
2. The customer enters a name, age, spending budget, and email address. Required fields and basic email format are validated.
3. A sectioned list presents pizzas, soft drinks, and alcoholic drinks with prices, descriptions, and images. Custom list items and an adapter track quantities.
4. Before checkout, the app calculates the subtotal and checks the order—including 21% VAT—against the customer's budget.
5. The checkout screen renders an itemised receipt, subtotal, VAT, and total.
6. The receipt can be handed to an installed email client through an Android `ACTION_SEND` intent.

## Implementation highlights

- Four activities: `SplashScreen`, `MainActivity`, `SecondScreenActivity`, and `CheckOut`.
- A custom `MyItemAdapter` for mixed section headers and purchasable rows.
- Serializable `Item` objects passed between activities.
- Product data stored in Android XML resources and resolved to drawable assets at runtime.
- Dynamic receipt-row inflation and email-intent integration.

## Technology

Java, Android XML layouts/resources, and the legacy Android support library. The manifest targets Android API 21 with a minimum API of 11.

## Running it today

`ShoppingListApp/` uses the pre-Gradle Eclipse Android project layout (`src`, `res`, `project.properties`). Importing it into a modern Android Studio version requires migration to Gradle, AndroidX replacements for old support classes, and likely small API/theme adjustments.
