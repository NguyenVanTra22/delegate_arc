import UIKit

//Tạo Protocol P
protocol PaginationDelegate {
  func passListPost(data: [String])
}
//Tại View Blog implement protocol PaginationDelegate
class Blog {
    var listPosts: [String] = []
    init() {
    }
}

extension Blog:PaginationDelegate {
    func passListPost(data: [String]) {
    self.listPosts = data
  }
}
//Tại Class Pagination
class Pagination {
  // Thuộc tính chứa instance của class Blog
  var delegate: PaginationDelegate?
  init(delegate: PaginationDelegate) {
    self.delegate = delegate
  }
  
  func getNewPost() {
    if let delegate = delegate {
      // Giả sử ta call API tại đây, nhận được 1 mảng gồm 3 phần tử
      let posts: [String] = ["Post 1", "Post 2", "Post 3"];

      // Giao tiếp với class cha bằng việc gọi đến function được khai báo trong Protocol
            // Đây chính là bước Return data trong quy trình ở mục 3
      delegate.passListPost(data: posts)
    }
  }
  
}
//Tạo instance Blog và Pagination
var blog = Blog()
var pagination = Pagination(delegate: blog)
print("Trước khi gọi func getNewPost: ")
print(blog.listPosts)

pagination.getNewPost()

print("Sau khi gọi func getNewPost: ")
print(blog.listPosts)

