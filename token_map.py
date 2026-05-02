# token_map.py

# Store the enum as a string (as you said)
enum_string = """
IF = 260,
ELSE = 261,
WHILE = 262,
FOR = 263,
UNKNOWN = 264,
INT_TYPE = 265,
FLOAT_TYPE = 266,
INT_NUM = 267,
FLOAT_NUM = 268,
ADD = 269,
SUB = 270,
MUL = 271,
DIV = 272,
GT = 273,
LT = 274,
LTE = 275,
GTE = 276,
EQ = 277,
NEQ = 279,
MODULO = 280,
OP = 281,
CP = 282,
OB = 283,
CB = 284,
ID = 285,
ASSIGN = 286,
COLON = 287
"""

# Build mapping: number -> token name
token_map = {}
for line in enum_string.strip().splitlines():
    line = line.strip().rstrip(',')
    if not line:
        continue
    name, value = line.split('=')
    token_map[int(value.strip())] = name.strip()

# Read file and replace tokens
def replace_tokens(input_file, output_file):
    with open(input_file, 'r') as f:
        content = f.readlines()

    output_lines = []

    for line in content:
        parts = line.split()
        new_parts = []

        for part in parts:
            # Try converting to int (token number)
            try:
                num = int(part)
                if num in token_map:
                    new_parts.append(token_map[num])
                else:
                    new_parts.append(part)
            except ValueError:
                # Not an integer (e.g., 3.14), keep as is
                new_parts.append(part)

        output_lines.append(" ".join(new_parts))

    with open(output_file, 'w') as f:
        f.write("\n".join(output_lines))


# Example usage
if __name__ == "__main__":
    replace_tokens("output.txt", "output.mapped.txt")

