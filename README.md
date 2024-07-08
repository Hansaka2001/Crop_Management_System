
# Crop Management System

## Overview

The Crop Management System is a Prolog-based application designed to provide information about various crops, soil types, fertilizers, and their growth stages. It includes an interactive menu to help users easily access the data and recommendations based on crop type, soil type, and growth stage.

## Features

- **Crop Types**: Provides a list of supported crops.
- **Soil Types**: Lists various soil types and their suitability for different crops.
- **Fertilizers**: Information about different fertilizers and their usage.
- **Growth Stages**: Detailed growth stages for each crop.
- **Recommendations**: Provides recommended fertilizers for crops based on growth stage and soil type.

## Usage

### Interactive Menu

To start the interactive menu, run the `start/0` predicate in your Prolog environment:

```prolog
?- start.
```

### Menu Options

1. **Display Available Crop Types**: Lists all crop types supported by the system.
2. **Display Available Soil Types**: Lists all soil types.
3. **Display Available Fertilizers**: Lists all fertilizers.
4. **Display Growth Stages for a Crop**: Shows growth stages for a specific crop.
5. **Get Recommended Fertilizers for a Crop and Growth Stage**: Provides fertilizer recommendations for a given crop and growth stage.
6. **Get Recommended Fertilizers for a Crop, Soil Type, and Growth Stage**: Provides fertilizer recommendations based on crop, soil type, and growth stage.
7. **Get Crops That Can Grow in a Specific Soil Type**: Lists crops suitable for a specific soil type.
8. **Get Recommended Fertilizers for a Crop Across All Growth Stages**: Lists recommended fertilizers for a crop across all growth stages.
9. **Exit**: Exit the interactive menu.

### Example Queries

#### Get Fertilizer List for Crop and Growth Stage

```prolog
?- get_fertilizer_list_for_crop_growth_stage.
Enter the crop: wheat.
Enter the growth stage: germination.
Recommended fertilizers for wheat at germination stage: [nitrogen, phosphorus]
```

#### Get Crops for Soil Type

```prolog
?- get_crops_for_soil_type.
Enter the soil type: loam.
Crops that can grow in loam soil: [wheat, corn, potato, tomato, soybean, barley, oats, sunflower, cotton]
```

## Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/Hansaka2001/crop-management-system.git
   ```
2. Open the Prolog environment and load the code:
   ```prolog
   ?- [crop_management_system].
   ```

## Contributing

Contributions are welcome! Please submit a pull request or open an issue to discuss your ideas or suggestions.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For any questions or suggestions, feel free to reach out via GitHub issues.

