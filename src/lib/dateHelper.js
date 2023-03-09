/** this trick allows Date objects to be converted into strings */
export function parseDate(data) {
  return JSON.parse(JSON.stringify(data));
}
