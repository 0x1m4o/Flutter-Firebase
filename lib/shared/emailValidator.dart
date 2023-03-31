var validateEmail = (value) {
  if (value!.isEmpty) {
    return 'The Email fields is required';
  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
    if (!value.contains('@')) {
      return 'Email address must contain "@" symbol';
    }
    if (!value.endsWith('.com') &&
        !value.endsWith('.org') &&
        !value.endsWith('.net')) {
      return 'Email address must end with ".com", ".org", etc';
    }
    return 'Please enter a valid email address';
  } else {
    return null;
  }
};
