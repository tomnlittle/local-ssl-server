module.exports = {
  transform: { '\.tsx?$': 'ts-jest', },
  collectCoverage: false,
  testRegex: '\\w\\.(test|spec)\\.ts$',
  moduleFileExtensions: ['ts', 'tsx', 'js', 'jsx', 'json'],
  testEnvironment: "node",
  testPathIgnorePatterns: [
    '/build/',
    '/node_modules/'
  ]
}
