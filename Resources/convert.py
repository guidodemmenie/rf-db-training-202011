def convert_dict_values_to_string(orig_dict):
    converted_dict = {}
    for key, value in orig_dict.items():
        converted_dict[key] = str(value)
    return converted_dict
