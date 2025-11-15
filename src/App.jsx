function App() {
  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-500 to-purple-600 flex items-center justify-center">
      <div className="bg-white rounded-lg shadow-2xl p-8 max-w-md w-full mx-4 text-center">
        <h1 className="text-4xl font-bold text-gray-800 mb-4">
          Hello World!
        </h1>
        <p className="text-lg text-gray-600 mb-6">
          Welcome to React with Tailwind CSS
        </p>
        <div className="flex justify-center space-x-4">
          <button className="bg-blue-500 hover:bg-blue-600 text-white font-semibold py-2 px-6 rounded-lg transition duration-300 ease-in-out transform hover:scale-105">
            Get Started
          </button>
          <button className="bg-gray-200 hover:bg-gray-300 text-gray-800 font-semibold py-2 px-6 rounded-lg transition duration-300 ease-in-out transform hover:scale-105">
            Learn More
          </button>
        </div>
      </div>
    </div>
  )
}

export default App


