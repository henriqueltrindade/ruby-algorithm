require 'byebug'
# @param {Integer[][]} image
# @param {Integer} sr
# @param {Integer} sc
# @param {Integer} new_color
# @return {Integer[][]}
def flood_fill(image, x, y, newColor)
  oldColor = image[x][y]
  if newColor != oldColor
    dfs(image, x, y, oldColor, newColor)
  end
  image
end

def dfs(image, x, y, oldColor, newColor)
  if ( image[x] && image[x][y] == oldColor)
    image[x][y] = newColor
    dfs(image, x - 1, y, oldColor, newColor) if (x >= 1)
    dfs(image, x, y - 1, oldColor, newColor) if (y >= 1)
    dfs(image, x + 1, y, oldColor, newColor) if (x + 1 <= image.length)
    dfs(image, x, y + 1, oldColor, newColor) if (y + 1 <= image.length)
  end
end

#image = [[1, 1, 1], [1, 1, 0], [1, 0, 1]]
#x = 1
#y = 1
#newColor = 2
#puts "Image: #{image}"
#puts "Image nova: #{flood_fill(image, x, y, newColor)}"

image = [[0,0,0],[0,1,0]]
x = 0
y = 0
newColor = 2
puts "Image: #{image}"
puts "Image nova: #{flood_fill(image, x, y, newColor)}"
