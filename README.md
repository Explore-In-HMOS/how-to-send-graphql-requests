> **Note:** To access all shared projects, get information about environment setup, and view other guides, please visit [Explore-In-HMOS Index](https://github.com/Explore-In-HMOS/hmos-index).

# How to Send GraphQl Requests

This codelab aims to provide users with educational content at sending http request to endpoints that designed with graphql tool. 
These endpoints wait customized queries according to needs. This codelab shows different type of variable needs for graphql requests.
Sending request without any variable, static variables and dynamic (changeable values).

# Preview

<div>
  <img src="screenshots/1.png" width="25%" />
  <img src="screenshots/2.png" width="25%" />
  <img src="screenshots/3.png" width="25%" />
</div>

# Use Cases
- Learn how to send graphql requests
- When you need request body with dynamic variable

# Technology

## Stack
- **Languages**: ArkTS, ArkUI
- **Frameworks**: HarmonyOS SDK 6.0.0(20)
- **Tools**: DevEco Studio Version 6.0.0
- **Libraries**:
    - `@kit.ArkUI`
    - `@kit.AbilityKit`
    - `@kit.BasicServicesKit`
    - `@kit.PerformanceAnalysisKit`
    - `@ohos.net.http`

## Required Permissions
- ohos.permission.INTERNET

# Directory Structure

```
entry/
├── src/main/ets/
│ │
│ ├── entryability/
│ │ └── EntryAbility.ets
│ │
│ ├── entrybackupability/
│ │ └── EntryBackupAbility.ets
│ │
│ ├── model/
│ │ ├── DefaultReturnModel.ets
│ │ ├── DynamicReturnModel.ets
│ │ ├── QueryModel.ets
│ │ └── StaticReturnModel.ets
│ │
│ ├── pages/
│ │ └── Index.ets
│ │
│ ├── service/
│ │ └── GraphQLService.ets
```

# Constraints and Restrictions

## Supported Devices

* Huawei Watch 5

* Huawei Ultimate 2

* DevEco Studio Emulator

# License (MIT)

**How to Send GraphQl Requests** is distributed under the terms of the MIT License. See the [LICENSE](LICENSE) for more information