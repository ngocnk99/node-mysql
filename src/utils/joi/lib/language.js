'use strict';

// Load modules


// Declare internals

const internals = {};


export const errors = {
  root: 'value',
  key: '"{{!label}}" ',
  messages: {
    wrapArrays: true
  },
  any: {
    unknown: 'không được phép',
    invalid: 'chứa giá trị không hợp lệ',
    empty: 'không được phép để trống',
    required: 'là bắt buộc',
    allowOnly: 'phải là một trong {{valids}}',
    default: 'bắn ra lỗi khi chạy phương thức mặc định'
  },
  alternatives: {
    base: 'khong khớp với bất kỳ giải pháp thay thế được phép nào',
    child: null
  },
  array: {
    base: 'phải là một mảng',
    includes: 'tại ví trí {{pos}} không khớp với bất kỳ lại được phép nào',
    includesSingle: 'giá trị đơn của "{{!label}}" không khớp với bất kỳ loại được phép nào',
    includesOne: 'tại ví trí {{pos}} không thành công vì {{reason}}',
    includesOneSingle: 'giá trị đơn của "{{!label}}" không thành công vì {{reason}}',
    includesRequiredUnknowns: 'không chứa {{unknownMisses}} giá trị bắt buộc',
    includesRequiredKnowns: 'không chứa {{knownMisses}}',
    includesRequiredBoth: 'không chứa {{knownMisses}} và {{unknownMisses}} giá trị bắt buộc khác',
    excludes: 'tại vị trí {{pos}} chứa giá trị loại trừ',
    excludesSingle: 'giá trị đơn của "{{!label}}" chứa giá trị loại trừ',
    hasKnown: 'không chứa ít nhất một kết quả trùng khớp cho loại "{{!patternLabel}}"',
    hasUnknown: 'không chứa it nhất một giá trị trùng khớp',
    min: 'phải chứa ít nhất {{limit}} mục',
    max: 'phải chứa ít hơn hoặc bằng {{limit}} mục',
    length: 'phải chứa {{limit}} mục',
    ordered: 'tại ví trí {{pos}} không thành công bởi {{reason}}',
    orderedLength: 'tại ví trí {{pos}} không thành công bởi mảng chứa tối đa {{limit}} mục',
    ref: 'tham chiếu "{{ref}}" không phải là số nguyên dương',
    sparse: 'không được là một mảng thưa thớt',
    unique: 'vị trí {{pos}} chứa giá trị trùng lặp'
  },
  boolean: {
    base: 'phải là boolean'
  },
  binary: {
    base: 'phải là bộ đệm hoặc chuỗi',
    min: 'phải có ít nhất {{limit}} bytes',
    max: 'phải nhỏ hơn hoặc bằng {{limit}} bytes',
    length: 'phải là {{limit}} bytes'
  },
  date: {
    base: 'phải là một số mili giây hoặc chuỗi ngày hợp lệ',
    strict: 'phải là một ngày hợp lệ',
    min: 'phải lớn hơn hoặc bằng "{{limit}}"',
    max: 'phải nhỏ hơn hoặc bằng "{{limit}}"',
    less: 'phải ít hơn "{{limit}}"',
    greater: 'phải lớn hơn "{{limit}}"',
    isoDate: 'phải là ngày ISO 8601 hợp lệ',
    timestamp: {
      javascript: 'phải là dấu thời gian hợp lệ hoặc số mili giây',
      unix: 'phải là dấu thời gian hợp lệ hoặc số giây'
    },
    ref: 'tham chiếu "{{ref}}" không phải là ngày'
  },
    function: {
      base: 'phải là Hàm',
      arity: 'phải có arity là {{n}}',
      minArity: 'phải có số lượng lớn hơn hoặc bằng {{n}}',
      maxArity: 'phải có mức độ nhỏ hơn hoặc bằng {{n}}',
      ref: 'phải là tham chiêu Joi',
      class: 'phải là một lớp'
    },
    lazy: {
        base: '!!lỗi lược đồ: lược đồ lười biếng phải được đặt',
      schema: '!! lỗi lược đồ: hàm lược đồ lười biếng phải trả về một lược đồ'
    },
    object: {
      base: 'phải là một đối tượng',
      child: '!!con "{{!child}}"  không thành công vì {{reason}}',
      min: 'phải có ít nhất {{limit}} trẻ em',
      max: 'phải có ít hơn hoặc bằng {{limit}} trẻ em',
      length: 'phải có {{limit}} trẻ em',
      allowUnknown: '!!"{{!child}}" không được phép',
      with: '!!"{{mainWithLabel}}" thiếu yêu cầu ngang hàng "{{peerWithLabel}}"',
      without: '!!"{{mainWithLabel}}" xung đột với đồng nghiệp bị cấm "{{peerWithLabel}}"',
      missing: 'phải chứa ít nhất một trong {{peersWithLabels}}',
      xor: 'chứa xung đột giữa các đồng nghiệp độc quyền {{peersWithLabels}}',
      oxor: 'chứa xung đột giữa các đồng nghiệp độc quyền tùy chọn {{peersWithLabels}}',
      and: 'chứa {{presentWithLabels}} mà không có các đồng nghiệp cần thiết của nó {{missingWithLabels}}',
      nand: '!!"{{mainWithLabel}}" không được tồn tại đồng thời với {{peersWithLabels}}',
      assert: '!!"{{ref}}" xác thực không thành công vì "{{ref}}" không thành công với {{message}}',
        rename: {
          multiple: 'không thể đổi tên con "{{from}}" vì nhiều lần đổi tên bị vô hiệu hóa và một khóa khác đã được đổi tên thành "{{to}}"',
          override: 'không thể đổi tên con "{{from}}" vì ghi đè bị vô hiệu hóa và mục tiêu "{{to}}" tồn tại',
            regex: {
              multiple: 'không thể đổi tên con {{from}} vì nhiều lần đổi tên bị vô hiệu hóa và một khóa khác đã được đổi tên thành "{{to}}"',
              override: 'không thể đổi tên con {{from}} vì ghi đè bị vô hiệu hóa và mục tiêu "{{to}}" tồn tại'
            }
        },
      type: 'phải là một phiên bản của "{{type}}"',
      schema: 'phải là một ví dụ Joi'
    },
  number: {
    base: 'phải là một số',
    unsafe: 'phải là số an toàn',
    min: 'phải lớn hơn hoặc bằng {{limit}}',
    max: 'phải nhỏ hơn hoặc bằng {{limit}}',
    less: 'phải nhỏ hơn {{limit}}',
    greater: 'phải lớn hơn {{limit}}',
    integer: 'phải là số nguyên',
    negative: 'phải là số âm',
    positive: 'phải là số dương',
    precision: 'phải có không quá {{limit}} vị trí thập phân',
    ref: 'tham chiếu "{{ref}}" không phải là số',
    multiple: 'phải là bội số của {{multiple}}',
    port: 'phải là một cổng hợp lệ'
  },
  string: {
    base: 'phải là một chuỗi',
    min: 'độ dài phải dài ít nhất {{limit}} ký tự',
    max: 'độ dài phải nhỏ hơn hoặc bằng {{limit}} ký tự',
    length: 'độ dài phải là {{limit}} ký tự',
    alphanum: 'chỉ được chứa các ký tự chữ và số',
    token: 'chỉ được chứa các ký tự chữ và số và dấu gạch dưới',
    regex: {
      base: 'với giá trị "{{!value}}" không khớp với mẫu được yêu cầu: {{pattern}}',
      name: 'với giá trị "{{!value}}" không khớp với mẫu {{name}} pattern',
      invert: {
        base: 'với giá trị "{{!value}}" khớp với mẫu đảo ngược: {{pattern}}',
        name: 'với giá trị "{{!value}}" khớp với mẫu {{name}} pattern'
      }
    },
    email: 'phải là một email hợp lệ',
    uri: 'phải là một uri hợp lệ',
    uriRelativeOnly: 'phải là một uri tương đối hợp lệ',
    uriCustomScheme: 'phải là một uri hợp lệ với lược đồ khớp với mẫu {{scheme}} pattern',
    isoDate: 'phải là ngày ISO 8601 hợp lệ',
    guid: 'phải là một GUID hợp lệ',
    hex: 'chỉ được chứa các ký tự thập lục phân',
    hexAlign: 'biểu diễn được giải mã hex phải được căn chỉnh byte',
    base64: 'phải là một chuỗi base64 hợp lệ',
    dataUri: 'phải là chuỗi dataUri hợp lệ',
    hostname: 'phải là tên máy chủ hợp lệ',
    normalize: 'phải là unicode được chuẩn hóa trong biểu mẫu {{form}} form',
    lowercase: 'chỉ được chứa các ký tự chữ thường',
    uppercase: 'chỉ được chứa các ký tự viết hoa',
    trim: 'không được có khoảng trắng hàng đầu hoặc dấu',
    creditCard: 'phải là thẻ tín dụng',
    ref: 'tham chiếu "{{ref}}" không phải là số',
    ip: 'phải là địa chỉ IP hợp lệ với {{cidr}} CIDR',
    ipVersion: 'phải là địa chỉ IP hợp lệ của một trong các phiên bản sau {{version}} với {{cidr}} CIDR'
  },
  symbol: {
    base: 'phải là một biểu tượng',
    map: 'phải là một trong {{map}}'
  }
};

export default {
  errors
}
