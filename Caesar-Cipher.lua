-- @file Class realize Caesar encryption metods.
-- @class caesarCipher
-- @author Full_droper <full_droper@pm.me>
-- @version 0.0.1
caesarCipher = {}
function caesarCipher:new()
    local obj= {}
    -- Encode input data by Caesar Cipher.
    -- @name encode
    -- @param {string} rawData - raw data for encode.
    -- @param {number/string} key - (default 1) count of shift.
    -- @return {string} The encoded by Caesar Cipher data 
    function obj:encode(rawData,key)
        if rawData == nil and type(rawData) ~= "string"  then
            return nil
        end
        key = key or 1
        if type(key) == "string" then
            key = tonumber(key)
        end
        if key < 1 then
            key = 1
        end
        local res = ""
        rawData:gsub(".",function(c) 
            res = res .. string.char( string.byte(c) + key)
        end)
        return res 
    end
    -- Decode input data by Caesar Cipher.
    -- @name decode
    -- @param {string} rawData - raw data for decode.
    -- @param {number/string} key - (default 1) count of shift.
    -- @return {string} The decoded by Caesar Cipher data  
    function obj:decode(rawData,key)
        if rawData == nil and type(rawData) ~= "string"  then
            return nil
        end
        key = key or 1
        if type(key) == "string" then
            key = tonumber(key)
        end
        if key < 1 then
            key = 1
        end
        local res = ""
        rawData:gsub(".",function(c) 
            res = res .. string.char( string.byte(c) - key)
        end)
        return res 
    end
    setmetatable(obj, self)
    self.__index = self; return obj
end

--создаем экземпляр класса
local conv = caesarCipher:new()
local word = "hello word"
local str1 = conv.encode(nil,word, 2)
local str2 = conv.decode(nil,str1, 2)
print(word .. " -> " .. str1 .. " -> " .. str2)