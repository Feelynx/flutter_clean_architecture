echo moving to the project directory...
cd ..

# Initialize the with_cubit variable to true
WITH_cubit=true

# Parse command-line arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --with-cubit)
            if [[ "$2" == "true" || "$2" == "false" ]]; then
                WITH_cubit=$2
                shift 2
            else
                echo "Error: --with-cubit must be followed by true or false"
                exit 1
            fi
            ;;
        *)
            if [ -z "$FEATURE_NAME" ]; then
                FEATURE_NAME=$(echo "$1" | awk '{print tolower($0)}')
                shift
            else
                echo "Error: Unknown argument $1"
                exit 1
            fi
            ;;
    esac
done

# Check if feature name is provided
if [ -z "$FEATURE_NAME" ]; then
  echo "Feature name is required"
  exit 1
fi

FEATURE_DIR="lib/features/$FEATURE_NAME"
CUBIT_DIR="$FEATURE_DIR/cubit"

# Check if the directory already exists
if [ -d "$FEATURE_DIR" ]; then
  echo "Error: Directory $FEATURE_DIR already exists"
  exit 1
fi

# Create feature directory
mkdir -p $FEATURE_DIR


# Capitalize the first letter of the feature name
CAPITALIZED_FEATURE_NAME=$(echo "$FEATURE_NAME" | awk '{print toupper(substr($0, 1, 1)) tolower(substr($0, 2))}')

# Create stateless widget file
cat <<EOL > $FEATURE_DIR/${FEATURE_NAME}_page.dart
import 'package:flutter/material.dart';

class ${CAPITALIZED_FEATURE_NAME}Page extends StatelessWidget {

  const ${CAPITALIZED_FEATURE_NAME}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Column(
            children: const [
              Text('$FEATURE_NAME Page'),
            ],
          ),
        );
  }
}
EOL


# Optionally create cubit file if WITH_cubit is true
if [ "$WITH_cubit" == "true" ]; then

# Create cubit directory
mkdir -p $CUBIT_DIR

# Create cubit file
cat <<EOL > $CUBIT_DIR/${FEATURE_NAME}_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part '${FEATURE_NAME}_state.dart';

class ${CAPITALIZED_FEATURE_NAME}Cubit extends Cubit<${CAPITALIZED_FEATURE_NAME}State> {
  ${CAPITALIZED_FEATURE_NAME}Cubit() : super(${CAPITALIZED_FEATURE_NAME}Initial());

  void load() {
    emit(${CAPITALIZED_FEATURE_NAME}Loading());
    // Add your loading logic here
    emit(${CAPITALIZED_FEATURE_NAME}Loaded());
  }

  void error() {
    emit(${CAPITALIZED_FEATURE_NAME}Error('An error occurred'));
  }
}
EOL

# Create state file
cat <<EOL > $CUBIT_DIR/${FEATURE_NAME}_state.dart
part of '${FEATURE_NAME}_cubit.dart';

sealed class ${CAPITALIZED_FEATURE_NAME}State extends Equatable {
  const ${CAPITALIZED_FEATURE_NAME}State();

  @override
  List<Object> get props => [];
}

class ${CAPITALIZED_FEATURE_NAME}Initial extends ${CAPITALIZED_FEATURE_NAME}State {}

class ${CAPITALIZED_FEATURE_NAME}Loading extends ${CAPITALIZED_FEATURE_NAME}State {}

class ${CAPITALIZED_FEATURE_NAME}Loaded extends ${CAPITALIZED_FEATURE_NAME}State {}

class ${CAPITALIZED_FEATURE_NAME}Error extends ${CAPITALIZED_FEATURE_NAME}State {
  final String message;

  const ${CAPITALIZED_FEATURE_NAME}Error(this.message);

  @override
  List<Object> get props => [message];
}
EOL
fi

echo "Feature $FEATURE_NAME created successfully."