export default function Home() {
  return (
    <div className="max-w-6xl mx-auto px-4 py-12">
      <section className="text-center mb-12">
        <h1 className="text-4xl font-bold mb-4">歡迎來到我的應用</h1>
        <p className="text-lg text-gray-600">
          這是一個使用 Next.js 建立的現代化應用程式
        </p>
      </section>

      <section className="grid grid-cols-1 md:grid-cols-3 gap-8">
        <div className="p-6 border border-gray-200 rounded-lg hover:shadow-lg transition">
          <h2 className="text-2xl font-semibold mb-2">功能 1</h2>
          <p className="text-gray-600">
            這裡可以描述你應用程式的第一個功能
          </p>
        </div>

        <div className="p-6 border border-gray-200 rounded-lg hover:shadow-lg transition">
          <h2 className="text-2xl font-semibold mb-2">功能 2</h2>
          <p className="text-gray-600">
            這裡可以描述你應用程式的第二個功能
          </p>
        </div>

        <div className="p-6 border border-gray-200 rounded-lg hover:shadow-lg transition">
          <h2 className="text-2xl font-semibold mb-2">功能 3</h2>
          <p className="text-gray-600">
            這裡可以描述你應用程式的第三個功能
          </p>
        </div>
      </section>
    </div>
  );
}