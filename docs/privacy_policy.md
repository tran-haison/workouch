# Privacy Policy

**Last Updated: March 2026**

## 1. Introduction

Welcome to Workouch ("we," "our," or "us"). Workouch is an AI-powered fitness application that helps you create, manage, and track your workouts. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application ("App").

By using Workouch, you agree to the collection and use of information in accordance with this policy. If you do not agree with our policies and practices, please do not use our App.

## 2. Information We Collect

### 2.1 Account Information

When you create an account or sign in, we collect:

- **Email address** (required for account creation and communication)
- **Full name** (if provided through authentication providers)
- **Avatar URL** (if provided through authentication providers)
- **Authentication credentials** (encrypted and stored securely via Supabase)

### 2.2 Profile Information

To provide personalized workout recommendations, we collect and store:

- **Gender** (male or female)
- **Age**
- **Height** (in centimeters)
- **Weight** (in kilograms)
- **Activity level** (sedentary, lightly active, moderately active, very active, extremely active)
- **Subscription tier** (basic, proMonthly, proYearly, proLifetime)

This information is used to calculate health metrics (BMI, TDEE, calories) and generate personalized workout recommendations.

### 2.3 Workout Data

We collect and store information about your workouts:

- **Workout names and configurations**
- **Exercise selections** (including exercise IDs, names, GIF URLs, descriptions, target muscles, body parts, equipment, instructions)
- **Set information** (sets, reps, weight, duration, distance, set types)
- **Rest times** (between sets and exercises)
- **Workout creation and modification timestamps**

### 2.4 AI Workout Generation Data

When you use AI-powered workout generation features, we may send the following information to our backend API:

- **Workout preferences** (text descriptions for each mode)
- **Workout specifications** (name, duration, intensity, goals, body parts, equipment, location, injuries/limitations)
- **User context** (age, height, weight, activity level, gender) - used to personalize workout recommendations

This data is processed by our Exercise API (api.vigorworkouch.com) which uses OpenAI's services to generate personalized workouts. Exercise data and workout recommendations are returned to your device and stored locally in your account.

### 2.5 Device and Usage Information

We automatically collect certain information when you use our App:

- **Device information** (device type, operating system, app version)
- **Usage analytics** (feature usage, app interactions) - collected via Firebase Analytics and Posthog
- **Crash reports and error logs** - collected via Firebase Crashlytics to improve app stability
- **App performance data** - collected via Firebase Remote Config for app optimization

### 2.6 Payment and Subscription Information

If you purchase a subscription:

- **Subscription status and tier** - managed through RevenueCat
- **Payment information** - processed entirely by Apple App Store (for iOS) or Google Play Store (for Android) and RevenueCat. We do not collect or store your payment card details.

## 3. How We Use Your Information

We use the information we collect to:

- **Provide and maintain our services** - Create and store your workouts, sync data across your devices
- **Personalize your experience** - Generate AI-powered workout recommendations based on your profile and preferences
- **Calculate health metrics** - Compute BMI, TDEE, and estimated daily calories based on your profile data
- **Improve our App** - Analyze usage patterns, fix bugs, and enhance features through analytics and crash reports
- **Process subscriptions** - Manage your subscription status and provide access to premium features
- **Communicate with you** - Send service-related notifications and respond to your inquiries
- **Ensure security** - Protect against fraud, abuse, and security threats

## 4. Data Storage and Security

### 4.1 Data Storage

Your data is stored securely in:

- **Supabase (PostgreSQL database)** - All user profile data, workouts, and exercise information are stored in Supabase cloud infrastructure with Row-Level Security (RLS) policies that ensure users can only access their own data
- **Local device storage** - Some data may be cached locally on your device for offline access and improved performance

### 4.2 Security Measures

We implement appropriate technical and organizational security measures to protect your personal information:

- **Encryption** - Data transmitted between your device and our servers is encrypted using HTTPS/TLS
- **Row-Level Security** - Database-level security policies ensure users can only access their own data
- **Secure authentication** - Passwords are hashed and never stored in plain text
- **Regular security updates** - We keep our systems and dependencies up to date with security patches
- **Access controls** - Limited access to user data on a need-to-know basis

However, no method of transmission over the internet or electronic storage is 100% secure. While we strive to use commercially acceptable means to protect your data, we cannot guarantee absolute security.

## 5. Third-Party Services

We use the following third-party services that may collect, store, or process your information:

### 5.1 Supabase

- **Purpose**: Authentication, database storage, and data synchronization
- **Data processed**: All user profile data, workouts, and exercise information
- **Privacy Policy**: https://supabase.com/privacy

### 5.2 Firebase (Google)

- **Services**: Analytics, Crashlytics, Remote Config
- **Data processed**:
  - Analytics: App usage patterns, feature interactions (anonymized)
  - Crashlytics: Crash reports, error logs, device information
  - Remote Config: App configuration settings
- **Privacy Policy**: https://policies.google.com/privacy

### 5.3 RevenueCat

- **Purpose**: Subscription management and payment processing
- **Data processed**: Subscription status, purchase history, user identifiers
- **Privacy Policy**: https://www.revenuecat.com/privacy

### 5.4 Google Sign-In

- **Purpose**: Authentication option
- **Data processed**: Email, name, avatar URL (only if you choose to sign in with Google)
- **Privacy Policy**: https://policies.google.com/privacy

### 5.5 Apple Sign-In

- **Purpose**: Authentication option
- **Data processed**: Email, name (only if you choose to sign in with Apple)
- **Privacy Policy**: https://www.apple.com/privacy/

### 5.6 Exercise DB API (api.vigorworkouch.com)

- **Purpose**: Exercise library access and AI workout generation
- **Data processed**: Workout preferences, user context, workout specifications (sent when generating AI workouts)
- **Note**: This is our own backend service that uses OpenAI's services for AI workout generation

### 5.7 OpenAI

- **Purpose**: AI-powered workout generation (via Exercise DB API)
- **Data processed**: Workout preferences, user context, workout specifications
- **Privacy Policy**: https://openai.com/policies/privacy-policy

### 5.8 Posthog

- **Purpose**: Product and usage analytics to understand how the App is used and improve features
- **Data processed**: App usage events, feature interactions, device and app information, and identifiers necessary for analytics
- **Privacy Policy**: https://posthog.com/privacy

## 6. Data Sharing and Disclosure

We do not sell, rent, or trade your personal information to third parties. We may share your information only in the following circumstances:

- **Service providers**: With third-party service providers who perform services on our behalf (as listed in Section 5)
- **Legal requirements**: When required by law, court order, or government regulation
- **Protection of rights**: To protect our rights, property, or safety, or that of our users or others
- **Business transfers**: In connection with a merger, acquisition, or sale of assets (you will be notified via email and/or a prominent notice in our App)

## 7. Your Rights and Choices

Depending on your location, you may have certain rights regarding your personal information:

### 7.1 Access and Portability

You can access your personal information through the App by viewing your profile page. Your workout data is accessible through the App's workout management features.

### 7.2 Correction

You can update your profile information (age, gender, height, weight, activity level) at any time through the App's profile settings.

### 7.3 Deletion

You can request deletion of your account and all associated data by:

1. Using the account deletion form: https://forms.gle/zgemJjqtUz4HqL6J7
2. Contacting us directly at the email address provided in Section 11

Upon account deletion:

- All your personal information, workout data, and profile information will be permanently deleted from our systems
- This action is irreversible
- Some information may remain in our backup systems for a limited period as required by law or for legitimate business purposes

### 7.4 Data Export

You can export your workout data by accessing your workouts through the App. For a complete data export, please contact us using the information provided in Section 11.

### 7.5 Subscription Cancellation

You can cancel your subscription at any time through:

- **iOS**: App Store → Subscriptions → Workouch → Cancel Subscription
- **Android**: Google Play Store → Subscriptions → Workouch → Cancel Subscription

Canceling your subscription will stop future charges, but you will retain access to premium features until the end of your current billing period.

### 7.6 Opt-Out of Analytics

You can opt out of analytics data collection by:

- **iOS**: Settings → Privacy → Analytics → Turn off "Share iPhone Analytics"
- **Android**: Settings → Privacy → Usage & diagnostics → Turn off usage data sharing

Note: Opting out may limit our ability to improve the App and provide support. We do not use your information for advertising purposes.

## 8. Children's Privacy

Workouch is not intended for children under the age of 13 (or 16 in the European Union). We do not knowingly collect personal information from children under 13 (or 16 in the EU). If we become aware that we have collected personal information from a child under 13 (or 16 in the EU), we will take steps to delete such information promptly.

If you believe we have collected information from a child under 13 (or 16 in the EU), please contact us immediately using the information provided in Section 11.

## 9. Data Retention

We retain your personal information for as long as necessary to:

- Provide you with our services
- Comply with legal obligations
- Resolve disputes
- Enforce our agreements

When you delete your account, we will delete your personal information within a reasonable timeframe, except where we are required to retain it for legal or legitimate business purposes.

## 10. International Data Transfers

Your information may be transferred to and processed in countries other than your country of residence. These countries may have data protection laws that differ from those in your country. By using our App, you consent to the transfer of your information to these countries.

We ensure that appropriate safeguards are in place to protect your information in accordance with this Privacy Policy, regardless of where it is processed.

## 11. California Privacy Rights (CCPA)

If you are a California resident, you have the following rights under the California Consumer Privacy Act (CCPA):

- **Right to know**: You have the right to request information about the categories and specific pieces of personal information we collect, use, and disclose
- **Right to delete**: You have the right to request deletion of your personal information
- **Right to opt-out**: We do not sell your personal information, so there is no opt-out mechanism needed
- **Non-discrimination**: We will not discriminate against you for exercising your privacy rights

To exercise these rights, please contact us using the information provided in Section 11.

## 12. European Privacy Rights (GDPR)

If you are located in the European Economic Area (EEA) or United Kingdom, you have the following rights under the General Data Protection Regulation (GDPR):

- **Right of access**: You can request access to your personal information
- **Right to rectification**: You can request correction of inaccurate information
- **Right to erasure**: You can request deletion of your personal information
- **Right to restrict processing**: You can request limitation of how we process your information
- **Right to data portability**: You can request transfer of your data to another service
- **Right to object**: You can object to processing of your personal information
- **Right to withdraw consent**: You can withdraw consent at any time where we rely on consent

To exercise these rights, please contact us using the information provided in Section 11.

## 13. Changes to This Privacy Policy

We may update this Privacy Policy from time to time to reflect changes in our practices or for other operational, legal, or regulatory reasons. We will notify you of any material changes by:

- Posting the new Privacy Policy in the App
- Updating the "Last Updated" date at the top of this policy
- Sending you an email notification (if we have your email address)

Your continued use of the App after such changes constitutes your acceptance of the updated Privacy Policy.

## 14. Contact Us

If you have any questions, concerns, or requests regarding this Privacy Policy or our data practices, please contact us at:

**Email**: vigor.workouch@gmail.com

**Website**: https://vigorworkouch.com

**Account Deletion Request**: https://forms.gle/zgemJjqtUz4HqL6J7

We will respond to your inquiry within a reasonable timeframe, typically within 30 days.

## 15. Additional Information

### 15.1 Health Information Disclaimer

The health metrics (BMI, TDEE, calories) and workout recommendations provided by Workouch are estimates and should not be considered as medical advice. Always consult with a healthcare professional before starting any new fitness program, especially if you have health conditions, injuries, or concerns.

### 15.2 Exercise Safety

While we provide exercise instructions and demonstrations, you are responsible for performing exercises safely and correctly. We are not liable for any injuries that may occur during or as a result of using our App or following workout recommendations.

### 15.3 AI-Generated Content

AI-generated workout recommendations are suggestions based on the information you provide. You are responsible for ensuring that workouts are appropriate for your fitness level, health condition, and goals.

---

**By using Workouch, you acknowledge that you have read and understood this Privacy Policy and agree to its terms.**
